# Capstone Project #2: Spot the Difference
## Overview
This project focuses on building an image classifying model that would be able to spot (no pun intended) the difference between several big cat breeds with similar appearences.


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
- (to be added...)

## Limitations
- Since this project focuses on image classification, using statistical techniques to solve this problem is impractical.
- (more...)

## Deliverables
I will provide the associated code (Jupyter notebooks), and the milestone report covering my approaches and findings.
