from datetime import time, timedelta, datetime

class Calculations:
    def available_periods(
            self,
            start_times,
            durations,
            begin_working_time,
            end_working_time,
            consultation_time):
        res = []
        working_time = (end_working_time - begin_working_time).total_seconds() // 60
        i = 0
        while i < working_time:
            start = timedelta(minutes=i) + begin_working_time
            end = timedelta(minutes=i) + begin_working_time + timedelta(minutes=consultation_time)
            prov = False
            interval = 0
            for j in range(len(start_times)):
                start_interval = start_times[j]
                end_interval = start_interval + timedelta(minutes=durations[j])
                if (start_interval <= start < end_interval) or (start_interval < end <= end_interval):
                    prov = True
                    interval = int((start_interval - start).seconds / 60) + durations[j]
            if prov:
                i += interval
            else:
                i += consultation_time
                if i <= working_time:
                    res.append(f"{self.format_timedelta(start)}-{self.format_timedelta(end)}")
        return res

    def format_timedelta(self, td):
        total_seconds = int(td.total_seconds())
        hours, remainder = divmod(total_seconds, 3600)
        minutes, _ = divmod(remainder, 60)

        return f"{hours:02d}:{minutes:02d}"

if __name__ == '__main__':
    calc = Calculations()
    start_times = [
        timedelta(hours=10, minutes=00),
        timedelta(hours=11, minutes=00),
        timedelta(hours=15, minutes=00),
        timedelta(hours=15, minutes=30),
        timedelta(hours=16, minutes=50)
    ]
    durations = [
        60, 30, 10, 10, 40
    ]
    begin_working_time = timedelta(hours=8, minutes=00)
    end_working_time = timedelta(hours=18, minutes=00)
    consultation_time = 30
    res = calc.available_periods(start_times, durations, begin_working_time, end_working_time, consultation_time)
    print(res)
