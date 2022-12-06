FROM tensorflow/tensorflow:latest-gpu-jupyter
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install torch torchvision==0.11.1+cu113 torchaudio===0.10.0+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
RUN apt-get update -y
RUN apt-get install ffmpeg -y
COPY script.py script.py
RUN python script.py
EXPOSE 8888