package br.com.alura.java.io.teste;

import java.io.File;
import java.util.Arrays;
import java.util.Locale;
import java.util.Scanner;

public class TesteLeitura2 {

	public static void main(String[] args) throws Exception {

		Scanner sc = new Scanner(new File("contas.csv"), "UTF-8");

		while (sc.hasNextLine()) {
			String linha = sc.nextLine();
//			System.out.println(linha);

			Scanner linhaScanner = new Scanner(linha);
			linhaScanner.useLocale(Locale.US);
			linhaScanner.useDelimiter(",");

			String tipoConta = linhaScanner.next();
			int agencia = linhaScanner.nextInt();
			int numero = linhaScanner.nextInt();
			String titular = linhaScanner.next();
			double saldo = linhaScanner.nextDouble();

			String valorFormatado = String.format(Locale.US, "%s - %04d-%08d, %12s: %08.2f", tipoConta, agencia, numero,
					titular, saldo);
			System.out.println(valorFormatado);

			linhaScanner.close();

//			Colocar o cvs num array e separar cada elemento do Array pela v�rgula, assim conseguindo acessar qualquer elemento do csv
//			String[] valores = linha.split(",");
//			System.out.println(valores[3]);
		}

		sc.close();
	}

}
