#  Ather Rizta S: Electric Scooter Performance Analysis

##  Problem Statement

Ather Energy, a leading electric scooter manufacturer, wants to understand how operational parameters influence real-world electric scooter performance. Specifically, the Ather Rizta S model is evaluated under daily commuting conditions to assess how tyre pressure, ride modes, and battery health contribute to performance variation.

The vehicle is equipped with smart BMS, TPMS, and supports multiple ride modes (Zip, Smart Eco). Data was generated to emulate production-level telemetry logs under AIS-compliant standards.

---

##  Objective

The primary objective of this project is:

> **To analyze how tyre pressure, battery metrics, and ride modes affect electric scooter performance, specifically focusing on efficiency, speed, and range.**

The study aims to:

* Identify correlations among tyre pressure, motor load, discharge current, and SOC drop.
* Evaluate performance consistency under real-world noise, degradation, and sensor drift.
* Align with India's **CAFE (Corporate Average Fuel Efficiency)** and **AIS-137 Part 3** standards for CO₂ reduction compliance.

---

##  Project Contents

* `Ather_Rizta_Realistic_Telemetry_25Days.csv` – Telemetry dataset (180,000+ rows)
* `ride-analysis.ipynb` – Full EDA, visualizations, and trend modeling notebook
* `README.md` – This project documentation

---

##  Tools & Libraries

* Python (Pandas, NumPy)
* Used Mysql to Create StarSchema
* Seaborn & Matplotlib (Data Visualization)
* Jupyter Notebook

---

##  Key Focus Areas

* Exploratory Data Analysis (EDA)
* Ride mode impact analysis (Zip vs Smart Eco)
* SOC degradation modeling
* Battery stress profiling (voltage sag, impedance, temperature)
* Tyre pressure vs efficiency/regression analysis.

---

##  Reference Links

* [AIS-137 Part 3 – Fuel Efficiency Standards (PDF)](https://hmr.araiindia.com/Control/AIS/45201991403AMAIS_137_Part_3_F.pdf)
* [Ather Riding Modes Explained](https://www.atherenergy.com/blog/riding-modes-of-an-ather-electric-scooter)
* [Tyre Pressure & Rolling Resistance Guide](https://www.trueenergy.io/blog/the-importance-of-maintaining-optimal-electric-vehicle-ev-tire-pressure/)
* [Battery Behavior Modeling – Ather Blog](https://medium.com/ather/data-analysis-beta-test-ride-chennai-67751b3a8812)

---

##  Contact

For queries or project access:
📧 [naveenlara7411@gmail.com](mailto:naveenlara7411@gmail.com)


