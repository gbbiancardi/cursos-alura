package br.com.bytebank.banco.modelo;

import java.io.Serializable;

/**
 * Classe representa a moldura de uma conta.
 * 
 * @author Gabriel Bertocco Biancardi
 *
 */

public abstract class Conta extends Object implements Comparable<Conta>, Serializable {
	protected double saldo;
	private int agencia;
	private int conta;
	private transient Cliente titular;
	private static int total = 0;

	/**
	 * Construtor para inicializar o objeto Conta a partir da agencia e conta.
	 * 
	 * @param agencia
	 * @param conta
	 */

	public Conta(int agencia, int conta) {
		Conta.total++;
		// System.out.println("O total de contas � " + Conta.total);
		this.agencia = agencia;
		this.conta = conta;
		// this.saldo = 100;
		// System.out.println("Conta: "+conta);
	}

	public abstract void deposita(double valor);

	/**
	 * Valor precisa ser maior do que o saldo.
	 * 
	 * @param valor
	 * @throws SaldoInsulficienteException
	 */

	public void saca(double valor) throws SaldoInsulficienteException {

		if (this.saldo < valor) {
			throw new SaldoInsulficienteException("Saldo: " + this.saldo + ", Valor: " + valor);
		}

		this.saldo -= valor;
	}

	public void transfere(double valor, Conta contaDestino) throws SaldoInsulficienteException {
		this.saca(valor);
		contaDestino.deposita(valor);
	}

	public double getSaldo() {
		return saldo;
	}

	public int getAgencia() {
		return agencia;
	}

	public void setAgencia(int agencia) {
		if (agencia >= 0) {
			this.agencia = agencia;
		} else {
			System.out.println("N�o pode valor negativo!");
			return;
		}

	}

	public int getConta() {
		return conta;
	}

	public void setConta(int conta) {
		if (conta >= 0) {
			this.conta = conta;
		} else {
			System.out.println("N�o pode valor negativo!");
			return;
		}

	}

	public Cliente getTitular() {
		return titular;
	}

	public void setTitular(Cliente titular) {
		this.titular = titular;
	}

	public static int getTotal() {
		return total;
	}

	public static void setTotal(int total) {
		Conta.total = total;
	}
	
	@Override
	public boolean equals(Object conta) {
		
		Conta outra = (Conta) conta;

		if (this.agencia != outra.agencia) {
			return false;
		}

		if (this.conta != outra.conta) {
			return false;
		}

		return true;
	}
	
	@Override
	public int compareTo(Conta o) {
		return Double.compare(this.saldo, o.saldo);
	}

	@Override
	public String toString() {
		return "Conta " + this.conta + ", Ag�ncia: " + this.agencia + ", Saldo: " + this.saldo;
	}

}
