# Introduction
This is the source code of our IJCAI 2017 paper "Cross-modal Common Representation Learning by Hybrid Transfer Network", Please cite the following paper if you use our code.

Xin Huang, Yuxin Peng, and Mingkuan Yuan, "Cross-modal Common Representation Learning by Hybrid Transfer Network", 26th International Joint Conference on Artificial Intelligence (IJCAI), pp. 1893-1900, Melbourne, Australia, Aug. 19-25, 2017. [[PDF]](http://59.108.48.34/mipl/tiki-download_file.php?fileId=400)

# Content
1. model.prototxt: network architecture of training stage
2. solver.prototxt: network solver
3. test.prototxt: network architecture of testing stage
4. Evaluate: Test codes for generating MAP scores


# Usage
1. Setup transfer-caffe  
Setup transfer-caffe from the following URL: https://github.com/zhuhan1236/transfer-caffe

2. Data Preparation (Taking Wikipedia as example)  
   According to model.prototxt, you need:
   1. Source Domain(ImageNet-ILSVRC2010): images folder, and list in .txt format (including label). Each line of List is in the format as "filepath label" like "n04347754_15004.JPEG 833".
   1. Target Domain(Wiki-Img): images folder, and list in .txt format(including similarity). Each line of List is in the format as "filepath similarity" like "geography/05fd84a06ea4f6769436760d8c5986c8.jpg 1". Note: We arrange data into img-txt pairs, so that all the "similarity labels" are set to be "1", which means all the input data are paired.
   1. Target Domain(Wiki-Txt): feature and label, in .lmdb format. In our paper, each text is represented as 3000-d bow vector. Each entry of lmdb includes this vector and its label. Note: Because all the input image and text are paired, the image pathway of network also takes labels from text lmdb during training stage.

3. Training  
 Train network with solver.prototxt and Pre-train model [AlexNet/alexnet_cvgj_wiki.caffemodel](http://59.108.48.34/mipl/tiki-download_file.php?fileId=1005). Remember to set your paths in model/test.prototxt and solver.prototxt

4. Testing  
   1. Extract common representation with test.prototxt (wiki_img_prob and wiki_txt_prob).  
   1. Compute MAP scores with extracted representations with Evaluate/evaluate_wiki.m. Note: we set an exapmle Label.mat file in this folder. You must create yourselves to match the labels of your test data.

Wikipeia dataset can be downloaded via: http://www.svcl.ucsd.edu/projects/crossmodal/ 

For more information, please refer to our [paper](http://59.108.48.34/mipl/tiki-download_file.php?fileId=400)

# Our Related Work
If you are interested in cross-media retrieval, you can check our recently published overview paper on IEEE TCSVT:

Yuxin Peng, Xin Huang, and Yunzhen Zhao, "An Overview of Cross-media Retrieval: Concepts, Methodologies, Benchmarks and Challenges", IEEE Transactions on Circuits and Systems for Video Technology (TCSVT), 28(9):2372-2385, 2018.[[PDF]](http://59.108.48.34/mipl/tiki-download_file.php?fileId=376)

Welcome to our [Benchmark Website](http://59.108.48.34/mipl/xmedia) and [Laboratory Homepage](http://www.icst.pku.edu.cn/mipl) for more information about our papers, source codes, and datasets.

