package mycart.com.learn.helper;

public class Helper {

	public static String get10Words(String desc) {
		String[] strs = desc.split(" ");

		if (strs.length > 20) {
			String res = "";
			for (int i = 0; i < 20; i++) {
				res += strs[i] + " ";
			}
			return res + "....";
		} else {
			return desc + "....";
		}

	}
}
