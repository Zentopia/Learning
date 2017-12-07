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

# my_data = np.genfromtxt('user_balance_table.csv', delimiter=',', skip_header=True)

# sub_data = my_data[np.where(my_data[:, 0] == 442)]
# total_purchase_amt = my_data[:, 4]
# report_date = my_data[:, 1]
# user_id = my_data[:, 0]

# total_redeem_amt = my_data[:, 8]
# data = {
#     # 'user_id': user_id,
#     'date': report_date,
#     'total_purchase_amt': total_purchase_amt
# }

# df = pd.DataFrame(data, columns=['date', 'total_purchase_amt'])
# df['report_date'] = df['report_date'].astype(int)
# df['report_date'] = df['report_date'].astype(str)
#
#
# df['report_date'] = pd.to_datetime(df['report_date'])
# df.index = df['date']
# del df['date']

# df = df.groupby('report_date')['total_purchase_amt'].sum()


# ts = pd.Series(df[total_purchase_amt], index=df['date'])

# 查看数据格式
# ts = pd.Series(df['date'], index=df['total_purchase_amt'])

# ts.plot()
# pyplot.show()

df = pd.read_csv('user_balance_table.csv', index_col='user_id', names=['user_id', 'report_date', 'tBalance', 'yBalance', 'total_purchase_amt', 'direct_purchase_amt', 'purchase_bal_amt', 'purchase_bank_amt', 'total_redeem_amt', 'consume_amt', 'transfer_amt', 'tftobal_amt', 'tftocard_amt', 'share_amt', 'category1', 'category2', 'category3', 'category4'
], parse_dates=[1])

print(df)


# df = df.groupby('report_date')['total_purchase_amt'].sum()
# df.plot()
# pyplot.show()

# print(df['report_date'].dtype)

