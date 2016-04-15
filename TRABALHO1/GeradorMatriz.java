// Matteus Legat //
// Algoritimo em java criado por mim usado para gerar a matriz do trabalho //
// Adaptado de 2015.1 //
public class GeradorMatriz {
  public static void main(String[] args) {

    int n = 100;  // Nro de equações
    double[][] x = new double[n][n+1];

    // Define todos como 0 inicialmente
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n;j++) {
        x[i][j] = 0;
      }
    }

    // 1ª linha
    int i = 1;
    x[i-1][i-1] = 1;
    x[i-1][i] = 1;
    x[i-1][n] = 1.50;
    i++;

    // 2ª à (n/2)ª linha
    for (; i <= n/2; i++) {
      x[i-1][i-2] = 1;
      x[i-1][i-1] = 3;
      x[i-1][i] = 1;
      x[i-1][i+n/2-1] = 1;
      x[i-1][n] = 1.00;
    }

    // ((n/2)+1)ª à (n-1)ª linha
    for (; i < n; i++) {
      x[i-1][i-n/2-1] = 1;
      x[i-1][i-2] = 1;
      x[i-1][i-1] = 3;
      x[i-1][i] = 1;
      x[i-1][n] = 2.00;
    }

    // nª linha
    x[i-1][i-2] = 1;
    x[i-1][i-1] = 1;
    x[i-1][n] = 3.00;

    // IMPRIME
    System.out.print("[");
    for (i = 0; i<n; i++) {
      if (i>0)
        System.out.print(" ");
        for (int j = 0; j<=n; j++) {
          System.out.print(x[i][j]);
          if (j != n)
            System.out.print(" ");
        }
      System.out.print(";\n");
    }
    System.out.print("]");
  }
}
