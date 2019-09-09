package br.com.alura.java.io.teste;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class TesteEscritaFileWriter {

	public static void main(String[] args) throws IOException {

		// FileWriter fw = new FileWriter("mussum2.txt");
		BufferedWriter bw = new BufferedWriter(new FileWriter("mussum2.txt"));
		
		bw.write("Mussum Ipsum, cacilds vidis litro abertis. Nullam volutpat risus nec leo commodo");
		bw.newLine();
		bw.newLine();
		bw.write("nisi eros vermeio. Interagi no me, cursus quis, vehicula ac nisi.");
		
		bw.close();
	}

}
