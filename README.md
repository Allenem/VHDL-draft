# VHDL作业和课设
## 一、作业
- hw1
  - 1、调查国内IC设计行业现状。有哪些好的设计公司，薪水情况，产品范围等。
  - 2、寻找并安装软件：modelsim, quartus.
- hw2
  - 1、什么是层次化设计
  - 2、为今天设计的AOI门写一个testbench，并用modelsim验证。
- hw3
  - encoder83
  - binaryencoder83
  - decoder38
  - decoder36
- hw4
  - 2分频
  - 3分频
- hw5  
  状态转换表
- hw6
  - subsystem
  - decoder47
  - states8 

## 二、课设——交织器与解交织

### 1.src结构
```
    In_DeModel.vhd
    //In_DeModel_tb.vhd
    InterLeaver.vhd
    ClockDelay.vhd
    DeInterLeaver.vhd
    AddrGen.vhd
    DeAddrGen.vhd
    RAM.vhd
    WRCon.vhd
    DataLock.vhd

    In_DeModel.vht  //testbench
```

### 2.说明

#### 代码调用结构

- ⑨交织解交织综合模块（调用⑤⑥⑧）：In_DeModel
  - ⑤交织器模块（调用①②③④）：InterLeaver
    - ①交织器读写地址模块：AddrGen
    - ②读写控制模块：WRCon
    - ③RAM模块：RAM
    - ④数据锁存模块：DataLock
  - ⑥时钟延时模块：ClockDelay 
  - ⑧解交织器模块（调用②③④⑦）：DeInterLeaver 
    - ②读写控制模块：WRCon
    - ③RAM模块：RAM
    - ④数据锁存模块：DataLock
    - ⑦解交织读写地址模块：DeAddrGen 
- ⑩交织解交织综合模块TestBench：In_DeModel_vhd_tst

#### 运行结果说明
仿真结果详见报告

## 三、4次实验报告汇总

文件：华南理工大学数字系统设计实验报告汇总docx

- 实验一、QUARTUS 软件的使用; VHDL程序结构的熟悉（延时、控制亮灯两个模块）
- 实验二、基本电路模块设计(组合、时序)（3-8 译码器、分频器实验）
- 实验三、基于状态机的交通灯控制
- 实验四、按键控制的状态机设计
