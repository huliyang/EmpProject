package cn.hly.util;

import java.math.BigDecimal;

public class MathUtil {
	/**
	 * 实现四舍五入
	 * @param num
	 * @param scale
	 * @return
	 */
	public static double round(double num, int scale) {
		return new BigDecimal(num).divide(new BigDecimal(1), scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}
}
