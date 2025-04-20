package com.tech.nest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tech.nest.entities.Tutorials;

public class TutorialDao {
	
	private Connection connection;

	public TutorialDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public List<Tutorials> getAllTutorials() throws SQLException {
		String q = "select * from tutorials";
		List<Tutorials> list = new ArrayList<Tutorials>();
		try (Statement statement = connection.createStatement();
				ResultSet set = statement.executeQuery(q);) {
			while (set.next()) {
				int tid = set.getInt("tid");
				String name = set.getString("name");
				String image = set.getString("image");
				String link = set.getString("link");
				
				Tutorials tutorials = new Tutorials(tid, name, image, link);
				list.add(tutorials);	
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
}
