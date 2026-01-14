# Prediction of Solar Suitability for Roof tops using Solar Pvs ( Data Anlyis, Machine learning model, Interactive Dashboard creation Using Power BI)
# Project Overview

The aim of this project to adopt Machine learning and Exploratory data analysis in
predicting if the properties are suitable or not suitable for installation of solar PVs based on the
condition which properties requires some features to qualify for solar installation using the
machine learning algorithm was demonstrated. 

# Dataset Used
https://www.ons.gov.uk/peoplepopulationandcommunity/housing/datasets/individualenergyperformancecertificateepcbandsenglandandwales

# Data Exploration using Python
Python code for Exploratory Data Analysis:
#!/usr/bin/env python
# coding: utf-8
# # Importing libraries
# In[1]:
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')
from matplotlib.pyplot import rcParams
rcParams['figure.figsize']=20,10
import seaborn as sns
sns.set(color_codes=True)
import sys
import os
import sagemaker     
import s3fs
import boto3
import re
import io
import sagemaker.amazon.common as smac
import pathlib
# Reading dataset
df=pd.read_csv(data_location)
# In[3]:
df.head()
# In[4]:
df.info()
# In[5]:
df.describe()
# In[6]:
df.shape
# In[7]:
df.columns
<img width="940" height="359" alt="image" src="https://github.com/user-attachments/assets/419cea20-03d3-4c89-bc42-3b2bbce27a0e" />

# In[8]:
df.isnull().sum()
# In[9]:
df.isnull().sum()/len(df)
# In[10]:
df.dtypes
<img width="940" height="596" alt="image" src="https://github.com/user-attachments/assets/7047a255-15c5-4c39-9874-dcae63639f83" />

# Data Cleaning
imputer=SimpleImputer(strategy='constant',fill_value='missing')
imputer.fit_transform(df)
new_df=df.fillna(0)
# Corelation Analysis
<img width="948" height="705" alt="image" src="https://github.com/user-attachments/assets/677937a4-7549-4a84-b3d7-acb6adc9eb73" />

# Feature Exploration
conditions=[
   
    ((new_df['PROPERTY_TYPE']=='House')|(new_df['PROPERTY_TYPE']=='Bungalow')) & 
    ((((((new_df['TRANSACTION_TYPE']=='rental (private)')|(new_df['TRANSACTION_TYPE']=='FiT application')|
         (new_df['TRANSACTION_TYPE']=='RHI application')|(new_df['TRANSACTION_TYPE']=='assessment for green deal')|
     (new_df['TRANSACTION_TYPE']=='new dwelling')| (new_df['TRANSACTION_TYPE']=='following green deal')))))) &
    (((new_df['BUILT_FORM']=='Semi-Detached')|(new_df['BUILT_FORM']=='Detached')|(new_df['BUILT_FORM']=='End-Terrace')))&
    ((((new_df['CURRENT_ENERGY_RATING']=='A')|(new_df['CURRENT_ENERGY_RATING']=='B')|(new_df['CURRENT_ENERGY_RATING']=='C')
       |(new_df['CURRENT_ENERGY_RATING']=='D'))))&
    (((new_df['ROOF_DESCRIPTION']!='Flat')|(new_df['ROOF_DESCRIPTION']!='Thatched')|(new_df['ROOF_DESCRIPTION']!='0')))
    & (new_df['LODGEMENT_DATE']>'01-04-2012')&(new_df['NUMBER_OPEN_FIREPLACES']<3)&(new_df['TOTAL_FLOOR_AREA']>25)
    
    
]
#choices=['high','medium','average','average']
choices=['high']
new_df['solar_suitable']=np.select(conditions,choices,default='low')
# In[39]:
new_df['solar_suitable'].value_counts().plot.pie(autopct="%1.1f%%")
# In[40]:
new_df['solar_suitable'].describe()
# data visualization

# Outlier detection
<img width="975" height="674" alt="image" src="https://github.com/user-attachments/assets/cfbf6b79-9521-451e-82d8-2facbebb091a" />
<img width="940" height="514" alt="image" src="https://github.com/user-attachments/assets/97afae18-464b-4bc0-b215-ce3f820474cf" />
# Machine learning model
<img width="940" height="323" alt="image" src="https://github.com/user-attachments/assets/a571cc64-243b-40b5-9c73-a55a6f58f216" />
<img width="940" height="423" alt="image" src="https://github.com/user-attachments/assets/72777eb6-e564-4cf8-9a82-c003d13558e4" />
<img width="940" height="659" alt="image" src="https://github.com/user-attachments/assets/4e0695d0-4059-468f-aaa1-0bb716c9aaa9" />





