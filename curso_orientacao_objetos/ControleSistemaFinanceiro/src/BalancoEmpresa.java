public class BalancoEmpresa {

	private ArmazenadorDeDividas dividas;
	
	public BalancoEmpresa(ArmazenadorDeDividas dividas) {
		this.dividas = dividas;
	}

	public void registraDivida(Divida divida) {
		dividas.salva(divida);
	}

	public void pagaDivida(Documento documentoCredor, Pagamento pagamento) {
		Divida divida = dividas.carrega(documentoCredor);
		if (divida != null) {
			divida.registra(pagamento);
		}
		dividas.salva(divida);
	}
}
