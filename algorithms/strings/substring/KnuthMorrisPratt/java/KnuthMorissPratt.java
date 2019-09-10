public class KnuthMorissPratt {
    public int substring(String text, String word) {
        int[] lps = createLps(word);
        int i =0, j = 0;
        while(i < text.length()) {
            if(text.charAt(i) == word.charAt(j)) {
                if(j == word.length() - 1) { 
                    return i - j;
                } else {
                    i++;
                    j++;
                }
                continue;
            }
            if(j == 0) i++;
            else j = lps[j - 1];
        }
        return -1;
    }

    //lps - longes preffix-suffix
    private int[] createLps(String word) {
        int[] lps = new int[word.length()];
        int i = 1, j = 0;
        lps[0] = 0;
        while(i < word.length()) {
            if(word.charAt(i) == word.charAt(j)) {
                j++;
                lps[i] = j;
                i++;
            } else {
                if(j != 0) {
                    j = lps[j - 1];
                } else {
                    j = 0;
                    i++;
                }
            }
        }
        return lps;
    }

    public static void main(String[] java) {
        System.out.println("------------------");
        System.out.println("Substring: Knuth-Moriss-Pratt");
        testSubstring("abababc", "ababc");
        testSubstring("aaaaaa", "aaa");
        testSubstring("aa", "aaaaa");
        testSubstring("ABABDABACDABABCABAB", "ABABCABAB");
        testSubstring("abcdxabcdyabcdg", "abcdg");
    }

    private static void testSubstring(String text, String word) {
        var util = new KnuthMorissPratt();
        System.out.print(word + " start index in " + text + ": ");
        System.out.println(util.substring(text, word));
    }
}
