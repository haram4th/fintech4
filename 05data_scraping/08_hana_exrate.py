from io import StringIO
import requests
import pandas as pd
import time
from datetime import datetime
from dbio import to_db

# 하나은행 환율 수집 함수
def exrate_get(ymd_dash, ymd):
    url="https://www.kebhana.com/cms/rate/wpfxd651_01i_01.do"
    payload = dict(ajax="true", tmpInqStrDt=ymd_dash, pbldDvCd="0", inqStrDt=ymd, inqKindCd="1", requestTarget="searchContentDiv")
    r = requests.get(url, params=payload)
    df = pd.read_html(StringIO(r.text))[0]
    df.insert(0, '날짜', ymd_dash)
    return df

# 컬럼명 평탄화하기
def flatten_cols(df):
    new_cols = {}
    for col in df.columns:

        if col[0] != col[1] == col[2]:
            if col[1] == "":
                new_cols[col] = col[0]
            else:
                new_cols[col] = col[0] + "_" + col[1].replace(" ", "_")
        elif col[0] != col[1] != col[2]:
            new_cols[col] = " ".join(col).replace(" ", "_")
        else:
            new_cols[col] = col[0].replace(" ", "_")

    return new_cols


def t_day():
    today = datetime.today()
    date = today.date()
    ymd_dash, ymd = date.strftime("%Y-%m-%d"), date.strftime("%Y%m%d")
    return ymd_dash, ymd


if __name__ == "__main__":
    # t_day() 함수로 오늘 날짜 만들 후 데이터 수집
    # data = exrate_get(*t_day())
    ymd_dash, ymd = t_day()
    data = exrate_get(ymd_dash, ymd)

    # 수집된 데이터프레임 컬럼명 평탄화하기
    new_cols_dict = flatten_cols(data)
    new_cols = [new_cols_dict[col] for col in data]
    data.columns = new_cols
    # dbio 함수로 결과 DB에 저장하기
    to_db("exchange_rage_data", "exchage_rate", data)
    print(f"{ymd_dash} 환율 데이터 수집 및 저장 완료")