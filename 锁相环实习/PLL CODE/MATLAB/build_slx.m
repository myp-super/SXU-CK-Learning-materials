%% build_slx.m
% ============================================================
% Programmatically build PLL.slx Simulink model
% Mirrors the block diagram from 电网PLL模拟测试 PDF
% ============================================================

function build_slx()
    modelName = 'PLL';

    % Close if open, create new
    if bdIsLoaded(modelName)
        close_system(modelName, 0);
    end
    new_system(modelName);
    open_system(modelName);

    % ---- Model Parameters ----
    GridFreq = 50;
    Fs = 50000;
    Ts = 1/Fs;

    % ---- Add Blocks ----

    % 1. Sine Wave (Input Signal)
    add_block('simulink/Sources/Sine Wave', [modelName '/Input Signal'], ...
        'Frequency', num2str(2*pi*GridFreq), ...
        'SampleTime', num2str(Ts), ...
        'Position', [50, 100, 130, 140]);

    % 2. Phase Detector (Product block: Input * cos)
    add_block('simulink/Math Operations/Product', [modelName '/Phase Detector'], ...
        'Inputs', '2', ...
        'Position', [200, 100, 230, 140]);
    add_block('simulink/Math Operations/Trigonometric Function', [modelName '/cos'], ...
        'Function', 'cos', ...
        'Position', [150, 200, 190, 240]);

    % 3. Notch Filter (Transfer Fcn)
    % Coefficients computed for 100Hz notch
    wn_notch = 2*pi*GridFreq*2;
    c1 = 0.1; c2 = 1e-5;
    x = 2*c2*wn_notch*Ts; y = 2*c1*wn_notch*Ts; z = wn_notch*Ts*wn_notch*Ts;
    B = [1, x-2, z-x+1];
    A = [1, y-2, z-y+1];

    add_block('simulink/Discrete/Discrete Filter', [modelName '/Notch Filter'], ...
        'Numerator', mat2str(B), ...
        'Denominator', mat2str(A), ...
        'SampleTime', num2str(Ts), ...
        'Position', [300, 100, 370, 140]);

    % 4. PI Loop Filter
    B0 = 166.877556; B1 = -166.322444; A1 = -1;
    B_lf = [B0, B1];
    A_lf = [1, A1];
    add_block('simulink/Discrete/Discrete Filter', [modelName '/PI Loop Filter'], ...
        'Numerator', mat2str(B_lf), ...
        'Denominator', mat2str(A_lf), ...
        'SampleTime', num2str(Ts), ...
        'Position', [450, 100, 520, 140]);

    % 5. VCO: Integrator
    add_block('simulink/Discrete/Discrete-Time Integrator', [modelName '/VCO Integrator'], ...
        'SampleTime', num2str(Ts), ...
        'Position', [600, 100, 670, 140]);
    add_block('simulink/Sources/Constant', [modelName '/wn'], ...
        'Value', num2str(2*pi*GridFreq), ...
        'Position', [550, 200, 590, 230]);
    add_block('simulink/Math Operations/Sum', [modelName '/freq sum'], ...
        'Inputs', '|+-', ...
        'Position', [550, 100, 570, 140]);

    % 6. Theta wrap
    add_block('simulink/Math Operations/Math Function', [modelName '/mod 2pi'], ...
        'Function', 'mod', ...
        'Position', [720, 100, 760, 140]);
    add_block('simulink/Sources/Constant', [modelName '/2pi'], ...
        'Value', num2str(2*pi), ...
        'Position', [700, 200, 730, 220]);

    % 7. Sin/Cos output
    add_block('simulink/Math Operations/Trigonometric Function', [modelName '/sin'], ...
        'Function', 'sin', ...
        'Position', [820, 100, 860, 140]);

    % 8. Scopes
    add_block('simulink/Sinks/Scope', [modelName '/Scope'], ...
        'Position', [900, 50, 960, 200]);
    add_block('simulink/Sinks/To Workspace', [modelName '/To Workspace'], ...
        'VariableName', 'simOut', ...
        'SaveFormat', 'Structure With Time', ...
        'Position', [900, 250, 960, 290]);

    % ---- Connect Blocks ----
    add_line(modelName, 'Input Signal/1', 'Phase Detector/1');
    add_line(modelName, 'cos/1', 'Phase Detector/2');        % feedback cos → PD
    add_line(modelName, 'Phase Detector/1', 'Notch Filter/1');
    add_line(modelName, 'Notch Filter/1', 'PI Loop Filter/1');
    add_line(modelName, 'wn/1', 'freq sum/1');
    add_line(modelName, 'PI Loop Filter/1', 'freq sum/2');
    add_line(modelName, 'freq sum/1', 'VCO Integrator/1');
    add_line(modelName, 'VCO Integrator/1', 'mod 2pi/1');
    add_line(modelName, '2pi/1', 'mod 2pi/2');
    add_line(modelName, 'mod 2pi/1', 'sin/1');
    add_line(modelName, 'mod 2pi/1', 'cos/1');
    % note: cos feedback already connected above, no duplicate needed
    add_line(modelName, 'sin/1', 'Scope/1');
    add_line(modelName, 'sin/1', 'To Workspace/1');

    % ---- Save ----
    save_system(modelName);
    fprintf('[build_slx] PLL.slx created successfully.\n');
    fprintf('Open with: open_system(''PLL'')\n');
end
