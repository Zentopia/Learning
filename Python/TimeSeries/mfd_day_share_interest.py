import matplotlib.pylab as plt
import pandas as pd

df = pd.read_csv('mfd_day_share_interest.csv',
                 parse_dates=[0])


df['mfd_date'] = pd.to_datetime(df['mfd_date'], errors='coerce')
labels = ['mfd_daily_yield', 'mfd_7daily_yield']
for label in labels:
    print(label)
    df[label] = pd.to_numeric(df[label], errors='coerce')

df = df.groupby('mfd_date').sum()
ts = df['mfd_7daily_yield']
ts.plot()
plt.show()
