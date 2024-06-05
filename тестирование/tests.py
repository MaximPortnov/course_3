import unittest
import cl

from datetime import timedelta


class TestCalculations(unittest.TestCase):
    def setUp(self):
        self.calc = cl.Calculations()

    def test_one(self):
        res_prov: list[str] = [
            '08:00-08:30',
            '08:30-09:00',
            '09:00-09:30',
            '09:30-10:00',
            '11:30-12:00',
            '12:00-12:30',
            '12:30-13:00',
            '13:00-13:30',
            '13:30-14:00',
            '14:00-14:30',
            '14:30-15:00',
            '15:40-16:10',
            '16:10-16:40',
            '17:30-18:00'
        ]

        start_times: list[timedelta] = [
            timedelta(hours=10, minutes=00),
            timedelta(hours=11, minutes=00),
            timedelta(hours=15, minutes=00),
            timedelta(hours=15, minutes=30),
            timedelta(hours=16, minutes=50)
        ]
        durations: list[int] = [
            60, 30, 10, 10, 40
        ]
        begin_working_time = timedelta(hours=8, minutes=00)
        end_working_time = timedelta(hours=18, minutes=00)
        consultation_time = 30
        res = self.calc.available_periods(start_times, durations, begin_working_time, end_working_time, consultation_time)
        self.assertListEqual(res, res_prov)

    def test_two(self):
        res_prov: list[str] = [
            '08:00-08:40',
            '08:40-09:20',
            '09:20-10:00',
            '10:10-10:50',
        ]

        start_times: list[timedelta] = [
            timedelta(hours=10, minutes=00),

        ]
        durations: list[int] = [
            10
        ]
        begin_working_time = timedelta(hours=8, minutes=00)
        end_working_time = timedelta(hours=11, minutes=00)
        consultation_time = 40
        res = self.calc.available_periods(start_times, durations, begin_working_time, end_working_time,
                                          consultation_time)
        # print(res)
        self.assertListEqual(res, res_prov)

    def test_(self):
        res_prov: list[str] = [
            '08:00-08:40',
            '08:40-09:20',
            '09:20-10:00',
            '10:10-10:50',
        ]

        start_times: list[timedelta] = [
            timedelta(hours=10, minutes=00),

        ]
        durations: list[int] = [
            10
        ]
        begin_working_time = timedelta(hours=8, minutes=00)
        end_working_time = timedelta(hours=11, minutes=00)
        consultation_time = 40
        res = self.calc.available_periods(start_times, durations, begin_working_time, end_working_time,
                                          consultation_time)
        self.assertListEqual(res, res_prov)




if __name__ == '__main__':
    unittest.main()
