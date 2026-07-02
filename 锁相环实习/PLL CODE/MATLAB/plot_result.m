function plot_result(result, caseName, saveDir)
% plot_result - Unified plotting for all PLL test cases
% =====================================================
% Generates 7 subplots, saves PNG and CSV data
%
% Inputs:
%   result   - PLL result struct (from PLL.m)
%   caseName - String identifier (e.g. 'Case1_PhaseJump')
%   saveDir  - Output directory for figures and data

if nargin < 3
    saveDir = fullfile(pwd, 'figures');
end

% Ensure output directory exists
if ~exist(saveDir, 'dir')
    mkdir(saveDir);
end

t = result.t;
u_input  = result.sin_est + result.phase_error;  % reconstruct input from saved data

% ---- Figure 1: 7-Panel Overview ----
fig = figure('Name', caseName, 'NumberTitle', 'off', ...
    'Position', [50, 50, 1200, 900], 'Color', 'w');

% Panel 1: Input Signal
ax1 = subplot(4, 2, 1);
plot(t, u_input, 'b-', 'LineWidth', 0.8);
hold on; grid on;
ylabel('Amplitude');
title('(1) Input Signal');
xlim([t(1), t(end)]);

% Panel 2: PLL Output (sin_est)
ax2 = subplot(4, 2, 2);
plot(t, result.sin_est, 'r-', 'LineWidth', 0.8);
hold on; grid on;
ylabel('Amplitude');
title('(2) PLL Output (sin\_est)');
xlim([t(1), t(end)]);

% Panel 3: Phase Error
ax3 = subplot(4, 2, 3);
plot(t, result.phase_error, 'k-', 'LineWidth', 0.8);
hold on; grid on;
ylabel('Error');
title('(3) Phase Error');
xlim([t(1), t(end)]);

% Panel 4: Frequency Estimate
ax4 = subplot(4, 2, 4);
plot(t, result.fo, 'm-', 'LineWidth', 0.8);
hold on;
yline(result.GridFreq, 'b--', 'LineWidth', 0.5);
grid on;
ylabel('Frequency (Hz)');
title('(4) Frequency Estimate');
legend('f_o', 'f_{nom}', 'Location', 'best');
xlim([t(1), t(end)]);

% Panel 5: Theta
ax5 = subplot(4, 2, 5);
plot(t, result.theta, 'g-', 'LineWidth', 0.8);
hold on; grid on;
ylabel('Theta (rad)');
title('(5) Phase Angle \theta');
xlim([t(1), t(end)]);
ylim([0, 2*pi]);

% Panel 6: Loop Filter Output
ax6 = subplot(4, 2, 6);
plot(t, result.ylf, 'c-', 'LineWidth', 0.8);
hold on; grid on;
ylabel('Amplitude');
title('(6) Loop Filter Output (ylf)');
xlim([t(1), t(end)]);

% Panel 7: Lock State
ax7 = subplot(4, 2, 7);
plot(t, result.lock_state, 'b-', 'LineWidth', 1.5);
hold on; grid on;
ylabel('Lock State');
title('(7) Lock State');
xlim([t(1), t(end)]);
ylim([-0.1, 1.1]);
yticks([0, 1]);
yticklabels({'Unlocked', 'Locked'});

% Panel 8: Input vs PLL Output (overlay, zoomed)
ax8 = subplot(4, 2, 8);
n_plot = min(length(t), round(0.1 / result.Ts));  % show ~100ms
t_zoom = t(1:n_plot);
plot(t_zoom, u_input(1:n_plot), 'b-', 'LineWidth', 0.8);
hold on;
plot(t_zoom, result.sin_est(1:n_plot), 'r--', 'LineWidth', 0.8);
grid on;
ylabel('Amplitude');
title('(8) Input vs PLL Output (Zoom)');
legend('Input', 'PLL', 'Location', 'best');
xlim([t_zoom(1), t_zoom(end)]);

% Overall title
sgtitle(['Software PLL Test: ', strrep(caseName, '_', ' ')], ...
    'FontSize', 14, 'FontWeight', 'bold');

% Save PNG
pngPath = fullfile(saveDir, [caseName, '.png']);
saveas(fig, pngPath);
fprintf('[plot_result] Saved: %s\n', pngPath);

% ---- Save CSV ----
csvPath = fullfile(saveDir, [caseName, '.csv']);
T = table( ...
    t(:), ...
    u_input(:), ...
    result.sin_est(:), ...
    result.phase_error(:), ...
    result.fo(:), ...
    result.theta(:), ...
    result.ylf(:), ...
    result.lock_state(:), ...
    'VariableNames', { ...
        'time', ...
        'input', ...
        'pll_output', ...
        'phase_error', ...
        'frequency', ...
        'theta', ...
        'loop_filter', ...
        'lock_state' ...
    } ...
);
writetable(T, csvPath);
fprintf('[plot_result] Saved: %s\n', csvPath);

% ---- Save MAT ----
matPath = fullfile(saveDir, [caseName, '.mat']);
save(matPath, 'result', 'caseName');
fprintf('[plot_result] Saved: %s\n', matPath);

end
