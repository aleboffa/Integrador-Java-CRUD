package modeloDAO;

import config.Conexion;
import interfaces.CRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Persona;

public class PersonaDAO implements CRUD {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Persona p = new Persona();

    @Override
    public List listar() {
        ArrayList<Persona> list = new ArrayList<>();
        String sql = "select * from persona";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Persona per = new Persona();
                per.setId(rs.getInt("id"));
                per.setDni(rs.getString("dni"));
                per.setNom(rs.getString("nombres"));
                //agregamos a la lista
                list.add(per);

            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Persona list(int id) {
        String sql = "select * from persona where id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt("id"));
                p.setDni(rs.getString("dni"));
                p.setNom(rs.getString("nombres"));

            }

        } catch (Exception e) {
        }
        return p;
    }

    @Override
    public boolean add(Persona per) {
        String sql = "insert into persona(dni,nombres)values('" + per.getDni() + "','" + per.getNom() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

@Override
    public boolean edit(Persona per) {
        String sql = "update persona set dni='" + per.getDni() + "',nombres='" + per.getNom() + "'where id=" + per.getId();

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "delete from persona where id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

}
