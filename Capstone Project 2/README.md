# Capstone Project #2: Classifying Images of Spotted Cat Breeds
## Overview
This project focuses on building an image classifying model that would be able to spot (no pun intended) the difference between several big cat breeds with similar appearences.

Links for files:
- Building models for the dataset:
	- [Part 1](https://github.com/sangyeolbaek/SB/blob/master/Capstone%20Project%202/image_processing_capstone2_1.ipynb)
	- [Part 2](https://github.com/sangyeolbaek/SB/blob/master/Capstone%20Project%202/image_processing_capstone2_2.ipynb)
- Using LIME to analyze the model's interpretations for each image:
	- [Image Interpretations](https://github.com/sangyeolbaek/SB/blob/master/Capstone%20Project%202/image_interpretation_capstone2.ipynb)
- Milestone Report: [Report](https://github.com/sangyeolbaek/SB/blob/master/Capstone%20Project%202/Capstone%20Project%202%20Milestone%20Report%202.pdf)


## Target Audience
The target audience for this project could be diverse, but for this project, it aims at:
- Feline fanatics
- Feline researchers
- Image recognition application developers


## Data
The dataset consists of a total of 4000 images, or 1000 images for each category: cheetah, jaguar, leopard, and snow leopard. You can check site in which the images were obtained: www.alamy.com

I used a Google Chrome extension to extract images from the image database.
Extension can be found in the Google Chrome Webstore:
https://chrome.google.com/webstore/detail/download-all-images/ifipmflagepipjokmbdecpmjbibjnakm


## Approach
1. Obtain the necessary images for each category, and organize them using bash shell.
2. Explore the dataset in order to find the target size for the image classification model. In this case, I initial chose 160x160, but later changed to 200x200.
3. Use Tensorflow's Keras library to build a simple model with a few layers and evaluate its validity.
4. Repeat #3, but with added Convolutional layers.
5. Apply transfer learning by using ResNet as the base model, which would be frozen, with a few Dense layers.
6. Repeat #5, but try changing learning rate and image size. Evaluate and compare both models.
7. Use LIME to create explanatory visualizations on the model's interpretations for both ResNet models for a few images.


## Results
|                    | Train Acc | Train Loss | Val Acc | Val Loss |
| :---               |       --: |        --: |     --: |      --: |
| Simple Model       | 24.3%     | 8.72       | 24.5%   | 8.82     |
| w/ Few Conv Layers | 24.7%     | 5.01       | 25.5%   | 4.98     |
| ResNet50           | 96.0%     | 0.142      | 84.6%   | 0.492    |

Clearly, applying transfer learning with the ResNet50 layer has tremendously boosted the model's accuracy. But, to refine the ResNet50 model even further:
1. Original
2. With `rescale=1./255.` for each image in the `ImageDataGenerator`
3. Change target size from 160x160 to 200x200
4. With addition to #3, `lr = 0.01`
5. With addition to #3, increase number of epochs: 5 -> 8

|    | Train Acc | Train Loss | Val Acc | Val Loss |
| :--|       --: |        --: |     --: |      --: |
| #1 | 96.0% | 0.142 | 84.6% | 0.492 |
| #2 | 43.1% | 1.28 | 42.9% | 1.27 |
| #3 | 97.7% | 0.0915 | 87.0% | 0.420 |
| #4 | 96.9% | 0.131 | 85.4% | 0.828 |
| #5 | 97.7% | 0.0871 | 88.3% | 0.544 |


## Limitations
- Since this project focuses on image classification, using statistical techniques to solve this problem is impractical.
- With the time constraint, I found it impractical to be dedicated to fine-tuning every layer's parameters, especially a model containing the ResNet50


## Deliverables
I will provide the associated code (Jupyter notebooks), and the milestone report covering my approaches and findings.
