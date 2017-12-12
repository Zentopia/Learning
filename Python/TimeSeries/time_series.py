import matplotlib.pylab as plt
import pandas as pd
from statsmodels.tsa.arima_model import ARIMA
from statsmodels.tsa.arima_model import ARMA
from statsmodels.tsa.stattools import adfuller
from statsmodels.graphics.tsaplots import plot_acf, plot_pacf
from statsmodels.tsa.stattools import acf, pacf
from pandas import Series
from pandas import DataFrame
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_squared_error
from math import sqrt
import pandas as pd
import numpy as np
import sys

def test_stationarity(timeseries):
    # Determing rolling statistics
    rolmean = pd.rolling_mean(timeseries, window=30)
    rolstd = pd.rolling_std(timeseries, window=30)

    # Plot rolling statistics:
    orig = plt.plot(timeseries, color='blue', label='Original')
    mean = plt.plot(rolmean, color='red', label='Rolling Mean')
    std = plt.plot(rolstd, color='black', label='Rolling Std')
    plt.legend(loc='best')
    plt.title('Rolling Mean & Standard Deviation')
    plt.show(block=False)

    # Perform Dickey-Fuller test:
    print ('Results of Dickey-Fuller Test:')
    dftest = adfuller(timeseries, autolag='AIC')
    dfoutput = pd.Series(dftest[0:4], index=['Test Statistic', 'p-value', '#Lags Used', 'Number of Observations Used'])
    for key, value in dftest[4].items():
        dfoutput['Critical Value (%s)' % key] = value
    print(dfoutput)

def _proper_model(ts_log_diff, maxLag):
    best_p = 0
    best_q = 0
    best_bic = sys.maxsize
    best_model=None
    for p in np.arange(maxLag):
        for q in np.arange(maxLag):
            model = ARMA(ts_log_diff, order=(p, q))
            try:
                results_ARMA = model.fit(disp=-1)
            except:
                continue
            bic = results_ARMA.bic
            print (bic, best_bic)
            if bic < best_bic:
                best_p = p
                best_q = q
                best_bic = bic
                best_model = results_ARMA
    return best_p,best_q,best_model

df = pd.read_csv('user_balance_table copy.csv', index_col='user_id', names=['user_id', 'report_date', 'tBalance', 'yBalance', 'total_purchase_amt', 'direct_purchase_amt', 'purchase_bal_amt', 'purchase_bank_amt', 'total_redeem_amt', 'consume_amt', 'transfer_amt', 'tftobal_amt', 'tftocard_amt', 'share_amt', 'category1', 'category2', 'category3', 'category4'
], parse_dates=[1])

df['report_date'] = pd.to_datetime(df['report_date'], errors='coerce')
df['total_purchase_amt'] = pd.to_numeric(df['total_purchase_amt'], errors='coerce')
df['total_redeem_amt'] = pd.to_numeric(df['total_redeem_amt'], errors='coerce')

# ts = df.groupby('report_date')['total_purchase_amt'].sum()
ts = df.groupby('report_date')['total_redeem_amt'].sum()

ts = ts['2014-03-01':]
differenced = ts.diff(7)
differenced = differenced[7:]
test_stationarity(differenced)
differenced.plot()
plt.show()
differenced.to_csv('total_purchase_amt_adjusted.csv')

lag_acf = acf(differenced, nlags=20)
lag_pacf = pacf(differenced, nlags=20, method='ols')

#Plot ACF:
plt.subplot(121)
plt.plot(lag_acf)
plt.axhline(y=0, linestyle='--', color='gray')
plt.axhline(y=-1.96/np.sqrt(len(differenced)),linestyle='--',color='gray')
plt.axhline(y=1.96/np.sqrt(len(differenced)),linestyle='--',color='gray')
plt.title('Autocorrelation Function')

#Plot PACF:
plt.subplot(122)
plt.plot(lag_pacf)
plt.axhline(y=0,linestyle='--',color='gray')
plt.axhline(y=-1.96/np.sqrt(len(differenced)),linestyle='--',color='gray')
plt.axhline(y=1.96/np.sqrt(len(differenced)),linestyle='--',color='gray')
plt.title('Partial Autocorrelation Function')
plt.tight_layout()
plt.show()

# plt.figure()
# plt.subplot(211)
# plt.axhline(y=-1.96/np.sqrt(len(differenced)),linestyle='--',color='gray')
# plt.axhline(y=1.96/np.sqrt(len(differenced)),linestyle='--',color='gray')
# plot_acf(differenced, ax=plt.gca(), lags=20)
# plt.subplot(212)
# plt.axhline(y=-1.96/np.sqrt(len(differenced)),linestyle='--',color='gray')
# plt.axhline(y=1.96/np.sqrt(len(differenced)),linestyle='--',color='gray')
# plot_pacf(differenced, ax=plt.gca(), lags=20)
# plt.show()

print(_proper_model(differenced, 10))

# model = ARIMA(ts, order=(1, 1, 0))
# results_AR = model.fit(disp=-1)
# plt.plot(differenced)
# plt.plot(results_AR.fittedvalues, color='red')
# plt.title('RSS: %.4f'% sum((results_AR.fittedvalues-differenced)**2))
# plt.show()
#
# model = ARIMA(ts, order=(0, 1, 1))
# results_MA = model.fit(disp=-1)
# plt.plot(differenced)
# plt.plot(results_MA.fittedvalues, color='red')
# plt.title('RSS: %.4f'% sum((results_MA.fittedvalues-differenced)**2))
# plt.show()

# purchase
# model = ARIMA(ts, order=(8, 1, 3))

#redeem
# model = ARIMA(ts, order=(5, 1, 7))
# model = ARIMA(ts, order=(4, 1, 5))
#
#
# results_ARIMA = model.fit(disp=-1)
# plt.plot(differenced)
# plt.plot(results_ARIMA.fittedvalues, color='red')
# print(results_ARIMA.fittedvalues)
# plt.title('RSS: %g' % sum((results_ARIMA.fittedvalues-differenced)**2))
# plt.show()
#
# predictions_ARIMA_diff = pd.Series(results_ARIMA.fittedvalues, copy=True)
# predictions_ARIMA = pd.Series([ts[0]], index=[ts.index[0]]).append(predictions_ARIMA_diff).cumsum()
#
# plt.plot(ts)
# plt.plot(-1 * predictions_ARIMA)
# plt.title('RMSE: %.g'% np.sqrt(sum((predictions_ARIMA - ts)**2)/len(ts)))
# plt.show()




