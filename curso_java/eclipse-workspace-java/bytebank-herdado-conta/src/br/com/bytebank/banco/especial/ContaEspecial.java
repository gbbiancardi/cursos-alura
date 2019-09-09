package br.com.bytebank.banco.especial;

import br.com.bytebank.banco.modelo.Conta;

public class ContaEspecial extends Conta {

	public ContaEspecial(int agencia, int conta) {
		super(agencia, conta);
	}

	@Override
	public void deposita(double valor) {
		super.saldo += valor;
	}

}
