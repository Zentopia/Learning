from pandas import np
# line plot of time series
from pandas import Series
from matplotlib import pyplot
import pandas as pd

# df.to_csv('example.csv', index=False)

# df.index = df['user_id']
# del df['date']
# ts = pd.Series(total_purchase_amt, index=report_date)
# ts.plot()
# pyplot.show()

my_data = np.genfromtxt('user_balance_table.csv', delimiter=',', skip_header=True)
# sub_data = my_data[np.where(my_data[:, 0] == 442)]
total_purchase_amt = my_data[:, 4]
report_date = my_data[:, 1]
user_id = my_data[:, 0]
# total_redeem_amt = my_data[:, 8]
data = {
    # 'user_id': user_id,
    'date': report_date,
    'total_purchase_amt': total_purchase_amt
}

df = pd.DataFrame(data, columns=['date', 'total_purchase_amt'])
df['date'] = df['date'].astype(int)
df['date'] = df['date'].astype(str)


df['date'] = pd.to_datetime(df['date'])
df.index = df['date']
del df['date']
df = df.groupby('date')['total_purchase_amt'].sum()
print(df)

ts = pd.Series(df[total_purchase_amt], index=df.index)
# print(df.dtypes)

# 查看数据格式
print(df)
# ts = pd.Series(df['date'], index=df['total_purchase_amt'])

# ts.plot()
# pyplot.show()

