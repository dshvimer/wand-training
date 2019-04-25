# What this is for

Used for senior design project in which we created a mixed reality musical instrument. Now it's basically a boilerplate project for training object detection models with Tensorflows Object Detection API.

Requirements:
1. Tensorflow installed
2. Protobuf installed
3. Bash environment w/ standard Unix tools

Easiest way to run

1. Create AWS EC2 GPU instance (p2.xlarge) using AWS deep learning AMI
2. Upon ssh login into machine. Activate tensorflow-py36 environment. The command is listed in the Message of the Day
3. ```git clone https://github.com/dshvimer/wand-training.git && cd wand-training```
4. ```./setup.bash```. If the file is not executable run ```sudo chmod +x setup.bash```
5. ```./preprocess.bash```
6. Open a tmux session.
7. Run ```./train_ssd_mobilenet_v2_wand.bash``` in one tmux pane. (May require activating correct python environment again)
8. Run ```tensorboard --logdir ssd_mobilenet_v2_wand``` in a second pane. If port 6006 is not open a security group with that TCP rule should be configured for the EC2 instance.
9. Detatch from tmux session and logout of server. The training and monitoring will continue to run as a session, this way closing the SSH connection doesn't terminate the process.
10. Visit tensorboard at <EC2 Instance IP>:6006

It is setup to perform transfer learning with the SSD Mobilenet V2 model pretrained and available on Tensorflow's model zoo.
To change this:

1. Edit the ```setup.bash``` script to download another model
2. Copy a new ```pipeline.config``` file from the ```data``` directory. Update this file to use the correct fine_tune_checkpoint
3. Copy the training script and edit it to use the proper config file and output directory

To use custom data:

1. Place images into ```data/images```
2. Place VOC annotations into ```data/annotations```
3. Run ```preprocess.bash```
