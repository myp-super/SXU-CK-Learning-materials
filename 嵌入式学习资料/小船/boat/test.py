from ultralytics import YOLO

# 加载模型
model = YOLO(r"C:\Users\Lenovo\Desktop\ultralytics-main\runs\detect\train\weights\best.pt")

# 进行推理
# source 指向你的测试集图片文件夹
results = model.predict(
    source=r"C:\Users\Lenovo\Desktop\ultralytics-main\yolo_dataset\images\test", 
    save=True,       # 保存结果
    conf=0.25,       # 置信度阈值，低于这个分数的框不显示
    iou=0.7          # NMS 阈值
)

print("推理完成，结果保存在 runs/detect/predict 文件夹中")