public class Main {
    public static void main(String[] args) {
        Loop1: for(int i = 2; i <= 9; i++ ) {
        for (int j= 1; j <= 9; j++) {
            if(j==5)
                break Loop1;
//                break;
//                continue Loop1;
//                continue;
                System.out.println(i+"x"+"j"+"="+i*j);
        }
        System.out.println();
        }
    }
}
//여러 개의 반복문이 중첩된 경우에는 break문으로 한 번에 못나가므로 이렇게 중첩 반복문 앞에 이름을 붙이고 break문을 두면 한 번에 벗어날수있다