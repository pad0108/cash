package kr.co.gdu.cash.vo;

public class YearIncome {
	private int year;
	private int income;
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getIncome() {
		return income;
	}
	public void setIncome(int income) {
		this.income = income;
	}
	@Override
	public String toString() {
		return "YearIncome [year=" + year + ", income=" + income + "]";
	}
}
