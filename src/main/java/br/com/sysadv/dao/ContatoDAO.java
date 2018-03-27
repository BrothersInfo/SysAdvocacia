package br.com.sysadv.dao;

import br.com.sysadv.bean.Contato;
import br.com.sysadv.bean.Endereco;
import br.com.sysadv.util.FabricaConexao;
import br.com.sysadv.util.Conversor;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContatoDAO {

	public ContatoDAO() {
	}

	public boolean salvar(Contato contato) {
		boolean valor = false;
		PreparedStatement ps = null;
		String SQL = "INSERT INTO contatos (nome,telefone,email,rua,bairro,codigoEndereco,foto) VALUES(?,?,?,?,?,?,?)";
		try {
			ps = FabricaConexao.getConexao().prepareStatement(SQL);
			ps.setString(1, contato.getNome());
			ps.setString(2, contato.getTelefone());
			ps.setString(3, contato.getEmail());
			ps.setString(4, contato.getRua());
			ps.setString(5, contato.getBairro());
			ps.setLong(6, contato.getEndereco().getCodigo());
			ps.setBytes(7, Conversor.stringToByte(contato.getFoto()));
			ps.executeUpdate();
			valor = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				FabricaConexao.desconectar();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return valor;
	}

	public boolean alterar(Contato contato) {
		System.out.println("alt123");
		boolean valor = false;
		PreparedStatement ps = null;
		String SQL = "UPDATE contatos SET nome = ?, telefone = ?, email = ?, rua = ?, bairro = ?, codigoEndereco = ?, foto = ? WHERE codigo = ?";
		try {
			ps = FabricaConexao.getConexao().prepareStatement(SQL);
			ps.setString(1, contato.getNome());
			ps.setString(2, contato.getTelefone());
			ps.setString(3, contato.getEmail());
			ps.setString(4, contato.getRua());
			ps.setString(5, contato.getBairro());
			ps.setLong(6, contato.getEndereco().getCodigo());
			ps.setBytes(7, Conversor.stringToByte(contato.getFoto()));
			System.out.println(Conversor.stringToByte(contato.getFoto()).length);
			ps.setLong(8, contato.getCodigo());
			ps.executeUpdate();
			valor = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				FabricaConexao.desconectar();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return valor;
	}

	public boolean excluir(Long codigo) {
		boolean valor = false;
		PreparedStatement ps = null;
		String SQL = "DELETE FROM contatos WHERE codigo = ?";
		try {
			ps = FabricaConexao.getConexao().prepareStatement(SQL);
			ps.setLong(1, codigo);
			ps.executeUpdate();
			valor = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				FabricaConexao.desconectar();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return valor;
	}

	public List<Contato> listarContatos(String nomeContato) {

		List<Contato> contatos = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String SQL = null;
		if (nomeContato != null) {
			SQL = "SELECT * FROM contatos WHERE nome LIKE '%" + nomeContato + "%' LIMIT 50";
		} else {
			SQL = "SELECT * FROM contatos LIMIT 50";
		}
		try {
			ps = FabricaConexao.getConexao().prepareStatement(SQL);
			rs = ps.executeQuery();
			while (rs.next()) {
				Contato contato = new Contato();
				contato.setCodigo(rs.getLong("codigo"));
				contato.setEmail(rs.getString("email"));
				contato.setNome(rs.getString("nome"));
				contato.setTelefone(rs.getString("telefone"));
				contato.setRua(rs.getString("rua"));
				contato.setBairro(rs.getString("bairro"));
				Conversor.byteToString(rs.getBytes("foto"), contato, false);

				contatos.add(contato);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				FabricaConexao.desconectar();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return contatos;

	}

	public Contato pegarContatoPeloCodigo(Long codigo) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM contatos WHERE codigo = ?";
		Contato contato = null;
		try {
			ps = FabricaConexao.getConexao().prepareStatement(SQL);
			ps.setLong(1, codigo);
			rs = ps.executeQuery();
			if (rs.next()) {
				EnderecoDAO dao = new EnderecoDAO();
				contato = new Contato();
				contato.setCodigo(rs.getLong("codigo"));
				contato.setEmail(rs.getString("email"));
				contato.setNome(rs.getString("nome"));
				contato.setTelefone(rs.getString("telefone"));
				contato.setRua(rs.getString("rua"));
				contato.setBairro(rs.getString("bairro"));
				Conversor.byteToString(rs.getBytes("foto"), contato, true);

				Endereco endereco = dao.buscarEnderecoCodigoContato(rs.getLong("codigoEndereco"));

				contato.setEndereco(endereco);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				FabricaConexao.desconectar();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return contato;
	}
}
