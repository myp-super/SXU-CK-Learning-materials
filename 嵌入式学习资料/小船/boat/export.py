from ultralytics import YOLO

# 加载你的训练权重
model = YOLO(r"C:\Users\Lenovo\Desktop\ultralytics-main\runs\detect\train\weights\best.pt")

# 导出 ONNX
# opset=12 是 RKNN 兼容性最好的版本
model.export(format="onnx", opset=12)