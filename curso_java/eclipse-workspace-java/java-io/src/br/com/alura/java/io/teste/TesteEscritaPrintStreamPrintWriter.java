package br.com.alura.java.io.teste;

import java.io.IOException;
import java.io.PrintWriter;

public class TesteEscritaPrintStreamPrintWriter {

	public static void main(String[] args) throws IOException {

//		FileWriter fw = new FileWriter("mussum2.txt");
//		BufferedWriter bw = new BufferedWriter(new FileWriter("mussum2.txt"));
		
//		PrintStream ps = new PrintStream("mussum2.txt");
		
		PrintWriter ps = new PrintWriter("lorem2.txt", "UTF-8");
		
		ps.println("Mussum Ipsum, cac�lds vidis litro abertis. Nullam volutpat risus nec leo commodo");
		ps.println();
		ps.println();
		ps.println("nisi eros vermeio. Interagi no me, cursus quis, vehicula ac nisi.");
		
		ps.close();
	}

}