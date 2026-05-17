import torch
import onnx
from models.experimental import attempt_load

# 1. 设置参数
weights = 'best.pt'
output_file = 'best_forced.onnx'
device = torch.device('cpu')

print(f"🔄 正在加载模型: {weights} ...")

# 2. 加载 YOLOv5 模型
model = attempt_load(weights, device=device)  # load FP32 model
model.eval()

# 3. 准备虚拟输入 (1张图片, 3通道, 640x640)
img = torch.zeros(1, 3, 640, 640).to(device)

# 4. 【核心步骤】强制导出 Opset 11
print("🚀 正在强制导出为 ONNX (Opset 11)...")
# dry_run 用于初始化模型结构
for _ in range(2):
    model(img) 

torch.onnx.export(
    model, 
    img, 
    output_file, 
    verbose=False, 
    opset_version=11,  # <--- 这里写死了 11，谁也改不了
    input_names=['images'], 
    output_names=['output0'], 
    dynamic_axes=None 
)

# 5. 【二次加工】强制降级 IR 版本 (解决 "IR version 10 is higher" 报错)
print("🔧 正在进行微创手术 (降级 IR Version)...")
onnx_model = onnx.load(output_file)

# 强制改为 IR v8 (地平线最稳的版本)
onnx_model.ir_version = 8 

# 检查并修正 Opset (双重保险)
for opset in onnx_model.opset_import:
    if opset.domain == "" or opset.domain == "ai.onnx":
        opset.version = 11

# 保存最终文件
onnx.save(onnx_model, output_file)

print(f"\n✅ 成功！文件已生成: {output_file}")
print(f"📊 最终版本检查 -> IR Version: {onnx_model.ir_version} (目标: 8)")
print(f"📊 最终版本检查 -> Opset Version: {onnx_model.opset_import[0].version} (目标: 11)")
print("\n👉 请将 best_forced.onnx 复制到虚拟机 convert_pack 文件夹使用！")