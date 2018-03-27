package br.com.sysadv.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.sysadv.bean.Usuario;
import br.com.sysadv.util.FabricaConexao;

public class LoginDAO {

    public boolean verificarLogin(String usuario, String senha) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String SQL = "SELECT * FROM usuario WHERE email = ? AND senha = ?";

        boolean retorno = false;

        try {
            ps = FabricaConexao.getConexao().prepareStatement(SQL);
            ps.setString(1, usuario);
            ps.setString(2, senha);

            rs = ps.executeQuery();

            if (rs.next()) {
                retorno = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return retorno;
    }

    public boolean salvarUsuario(Usuario usuario) {
        PreparedStatement ps = null;
        String SQL = "INSERT INTO usuario (nome,telefone,endereco,email,senha) VALUES(?,?,?,?,?)";
        boolean retorno = false;
        try {
            ps = FabricaConexao.getConexao().prepareStatement(SQL);
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getTelefone());
            ps.setString(3, usuario.getEndereco());
            ps.setString(4, usuario.getEmail());
            ps.setString(5, usuario.getSenha());

            ps.executeUpdate();
            retorno = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return retorno;
    }

}
