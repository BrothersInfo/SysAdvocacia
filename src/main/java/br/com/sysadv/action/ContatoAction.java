package br.com.sysadv.action;

import br.com.sysadv.bean.Contato;
import br.com.sysadv.bean.Endereco;
import br.com.sysadv.dao.ContatoDAO;
import br.com.sysadv.dao.EnderecoDAO;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

@ParentPackage(value = "json-default")
public class ContatoAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	public Contato contato;
	public List<Contato> listaContatos;
	public List<Endereco> listaCidades;
	public Long codigoContato;
	public String nomeContato = null;

	public String foto;

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	@Action(value = "salvarContato", results = { @Result(name = "success", location = "/paginas/listarContatos.jsp") })
	public String salvarContato() {
		System.out.println(contato.getFoto());
		ContatoDAO dao = new ContatoDAO();
		EnderecoDAO enderecoDAO = new EnderecoDAO();
		dao.salvar(this.contato);
		this.listaContatos = dao.listarContatos(this.nomeContato);
		this.listaCidades = enderecoDAO.listarEndereco(null);
		return "success";
	}

	@Action(value = "novoContato", results = { @Result(name = "success", location = "/paginas/novoContato.jsp") })
	public String novoContato() {
		EnderecoDAO enderecoDAO = new EnderecoDAO();
		this.listaCidades = enderecoDAO.listarEndereco(null);
		return "success";
	}

	@Action(value = "alterarContato", results = {
			@Result(name = "success", location = "/paginas/alterarCadastro.jsp") })
	public String alteraContato() {
		EnderecoDAO enderecoDAO = new EnderecoDAO();
		ContatoDAO dao = new ContatoDAO();
		this.listaCidades = enderecoDAO.listarEndereco(null);
		this.contato = new Contato();
		this.contato = dao.pegarContatoPeloCodigo(this.codigoContato);
		return "success";
	}

	@Action(value = "confirmarAlteracao", results = {
			@Result(name = "success", location = "/paginas/listarContatos.jsp") })
	public String confirmarAlteracao() {
		ContatoDAO dao = new ContatoDAO();
		dao.alterar(this.contato);
		this.listaContatos = dao.listarContatos(this.nomeContato);
		return "success";
	}

	@Action(value = "listarContatos", results = { @Result(name = "success", location = "/paginas/listarContatos.jsp") })
	public String listarContatos() {
		ContatoDAO dao = new ContatoDAO();
		this.listaContatos = dao.listarContatos(this.nomeContato);
		return "success";
	}

	@Action(value = "listarContatosAJAX", results = { @Result(name = "success", type = "json") })
	public String listarContatosAJAX() {
		ContatoDAO dao = new ContatoDAO();
		this.listaContatos = dao.listarContatos(this.nomeContato);
		return "success";
	}

	@Action(value = "excluirCliente", results = { @Result(name = "success", location = "/paginas/listarContatos.jsp") })
	public String excluirCliente() {
		ContatoDAO dao = new ContatoDAO();
		dao.excluir(this.codigoContato);
		this.listaContatos = dao.listarContatos(this.nomeContato);
		return "success";
	}

	public Contato getContato() {
		return this.contato;
	}

	public void setContato(Contato contato) {
		this.contato = contato;
	}

	public List<Contato> getListaContatos() {
		return this.listaContatos;
	}

	public void setListaContatos(List<Contato> listaContatos) {
		this.listaContatos = listaContatos;
	}

	public List<Endereco> getListaCidades() {
		return this.listaCidades;
	}

	public String getNomeContato() {
		return this.nomeContato;
	}

	public void setNomeContato(String nomeContato) {
		this.nomeContato = nomeContato;
	}

	public Long getCodigoContato() {
		return this.codigoContato;
	}

	public void setCodigoContato(Long codigoContato) {
		this.codigoContato = codigoContato;
	}
}