# Improved DDAD for Anomaly Detection in Breast Cancer X-Rays

This repository contains my implementation of the **Dual-Distribution Discrepancy for Anomaly Detection in Chest X-Rays** (originally presented at MICCAI 2022) using TensorFlow and CUDA. My project aimed to replicate the original results and explore potential improvements to the accuracy of anomaly detection in breast cancer X-rays.

## Original Work

The original work, **[Dual-Distribution Discrepancy for Anomaly Detection in Chest X-Rays](https://arxiv.org/pdf/2206.03935.pdf)**, was presented by Yu Cai, Hao Chen, Xin Yang, Yu Zhou, and Kwang-Ting Cheng at MICCAI 2022. The PyTorch implementation of this work can be found [here](https://github.com/caiyu6666/DDAD).

## My Implementation

I have successfully implemented the original methodology using **TensorFlow** with **CUDA** support, allowing for faster training and evaluation on GPU-enabled systems. The following steps were involved in the implementation:

1. **Data Preparation**: Preprocessed the required datasets and organized them in the specified format.
2. **Model Implementation**: Implemented the reconstruction networks for both modules A and B in TensorFlow.
3. **Training and Evaluation**: Trained the models on the RSNA dataset and evaluated their performance in detecting anomalies in breast cancer X-rays.

<img src='imgs/DDAD.png' width="700px"/>

## Attempted Improvement

To improve the accuracy of the anomaly detection method, I introduced a new approach where I directly compared the reconstruction errors of modules A and B. The hypothesis was that this direct comparison could provide a more robust indication of anomalies. Specifically:

- **New Method**: After training the models, instead of using the original classification approach, I compared the reconstruction errors from modules A and B directly. If the error from module A was greater than that from module B, the image was classified as normal; otherwise, it was classified as anomalous.

## Results

Unfortunately, the new method of directly comparing the reconstruction errors did not yield better accuracy compared to the original method. The results indicate that the original approach remains more effective for this task.

## Requirements

To run this implementation, you will need the following:

- Python 3.6+
- TensorFlow 2.5+
- CUDA 11.0+
- TensorBoard 2.5.0
- Pillow 6.1.0
- pydicom 2.3.0 (for data preprocessing)

## Data Preparation

1. Follow the steps in the original repository to download and preprocess the datasets.
2. Organize the datasets in the following structure:

```plaintext
├─DATA_PATH
│ ├─rsna-pneumonia-detection-challenge   # data root of RSNA dataset
│ │ ├─train_png_512   # preprocessed images of rsna dataset 
│ │ │ ├─xxx.png
│ │ │ ├─ ......
│ │ ├─data.json   # repartition file of rsna dataset (renamed from "rsna_data.json")
│ ├─VinCXR   # data root of VinBigData dataset
│ │ ├─train_png_512   # preprocessed images of VinBigData dataset
│ │ │ ├─xxx.png
│ │ │ ├─ ......
│ │ ├─data.json   # repartition file of VinBigData dataset (renamed from "vin_data.json")

