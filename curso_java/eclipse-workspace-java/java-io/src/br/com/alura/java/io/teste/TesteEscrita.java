package br.com.alura.java.io.teste;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;

public class TesteEscrita {

	public static void main(String[] args) throws IOException {

		// Fluxo de Entrada com Arquivo 02
		OutputStream fos = new FileOutputStream("mussum2.txt"); // InputStream � a classe pai
		Writer osw = new OutputStreamWriter(fos); // Reader � a classe mais gen�rica, classe pai
		BufferedWriter bw = new BufferedWriter(osw); // Transformando os Characteres em Linhas

		bw.write("Mussum Ipsum, cacilds vidis litro abertis. Nullam volutpat risus nec leo commodo");
		bw.newLine(); // apenas para informar que terminou a primeira linha
		bw.newLine();
		bw.write("nisi eros vermeio. Interagi no me, cursus quis, vehicula ac nisi.");
		
		bw.close();
	}

}
