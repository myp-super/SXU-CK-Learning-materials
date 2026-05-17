from ultralytics.models import NAS ,RTDETR,SAM,YOLO,FastSAM,YOLOWorld

if __name__=="__main__":

    model =YOLO(r"C:\Users\Lenovo\Desktop\小船\boat\ultralytics\cfg\models\v5\yolov5.yaml")\
    .load("yolov5s.pt")

    results = model.train(data=r"C:\Users\Lenovo\Desktop\ultralytics-main\yolo_dataset\data.yaml",
                          epochs=100,imgsz=640,batch=8,workers=1)