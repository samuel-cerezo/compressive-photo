# Compressive Sensing Mapping System for Spatial Characterization of Photovoltaic Devices

This repository provides a complete set of MATLAB scripts and functions to explore the principles and applications of **Compressive Sensing (CS)** — a signal acquisition paradigm that exploits sparsity to reconstruct signals from fewer samples than traditionally required.

## 🔍 Overview

Compressive sensing leverages the idea that many natural signals are sparse in some domain (e.g., time, frequency, wavelet), allowing their reconstruction from underdetermined linear systems. This repository includes:

- Simulation of **sparse signals** (both deterministic and random)
- Construction of **measurement matrices** (Gaussian, Bernoulli, partial Fourier)
- **Signal acquisition** using random projections
- **Signal recovery** via:
  - Matching Pursuit (MP)
  - Orthogonal Matching Pursuit (OMP)
  - Basis Pursuit (using convex optimization)
- Error analysis and visualizations of reconstruction quality

All scripts are implemented in **MATLAB** and are intended for educational or research purposes.


## 📚 Requirements

- MATLAB R2019b or newer
- Optimization Toolbox (for Basis Pursuit)

## 📈 Features

- Easy-to-modify parameters: signal length, sparsity, noise level, number of measurements
- Visual feedback for performance analysis
- Modular structure for adding custom recovery algorithms


## 👤 Author

Samuel Cerezo  
[https://samuel-cerezo.github.io](https://samuel-cerezo.github.io/compressive_sensing)

If you use this code in your research or teaching, please consider citing or linking to the original webpage.
