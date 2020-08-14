ASPS_MN
======
**This is an implementation of  Hyperspectral Band Selection via Adaptive Subspace Partition Strategy.**
  
Dataset
------
**Four public datasets, i.e., [Indian Pines](http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes "Indian Pines"), [Botswana](http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes "Botswana"), [Pavia University](http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes "Pavia University")， and [Salinas](http://www.ehu.eus/ccwintco/index.php?title=Hyperspectral_Remote_Sensing_Scenes "Salinas"), are employed to verify the effectiveness of the  proposed ASPS_MN.**

Requirement
---------
**MATLAB**

Implementation
--------
**With respect to ASPS_MN algorithm, to run the code, please perform 'main.m'.**

Result
--------
**To qualitatively measure the proposed ASPS_MN, four classifiers are employed to verify the effectiveness of the algorithm.**


Classification Performance
----------
![Image text](https://raw.githubusercontent.com/qianngli/Images/master/asps_ip.png)
![Image text](https://raw.githubusercontent.com/qianngli/Images/master/asps_pu.png)
![Image text](https://raw.githubusercontent.com/qianngli/Images/master/asps_s.png)

Computational Time 
----------
| Dataset  |  TOF |  MDSR |  WaLuDi | RMBS | UBS | ASPS_MN (10%)| ASPS_MN (100%) |
| :------------: | :------------: | :------------: | :------------: | :------------: | :------------: | :------------: | :------------: |
|  Indian Pines (15 bands) | 0.649 | 0.205 | 7.507 | 43.618| 0.009 | 0.915 | 6.785 |
|  Pavia University (10 bands) |0.741 | | 0.208 | 26.775 | 200.396 | 0.009 | 0.895 | 3.440 |
|  Salinas (15 bands) | 1.356 | 0.313 | 40.357 | 265.555 | 0.003 | 1.128 | 5.884 |

Citation 
--------
**Please consider cite this paper if you find it helpful.**

@article{Wang2019Hyper, \
    title={Hyperspectral Band Selection via Adaptive Subspace Partition Strategy},\
    author={Q. Wang, Q. Li, and X. Li},\
    journal={IEEE Journal of Selected Topics in Applied Earth Observations and Remote Sensing},\
    year={2019},\
    DOI={10.1109/JSTARS.2019.2941454},\
    publisher={IEEE} \
}
	
	
--------
If you has any questions, please send e-mail to liqmges@gmail.com.



