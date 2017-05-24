package my.learning.payment.system.utils;

public class Validator {

    public static boolean isSumValid(Integer sum, Integer min, Integer max, Integer bal) {
        System.out.println("WE ARE IN VALIDATOR. SUM = " + sum + ", MIN = " + min + ", MAX = " + max + ", BAL = " + bal);
        if((sum < min) || (sum >max) || (sum > bal)) {
            System.out.println("WRONG SUM!!!!");
            return false;
        } else return true;
    }
}
