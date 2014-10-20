package dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import pojos.Category;
import pojos.Mood;
import pojos.Place;
import pojos.Rate;
import pojos.User;

public class BusinessLayer {

	private SessionFactory sessionFactory;
	private Session session;
	private static BusinessLayer bs;

	public static BusinessLayer instance() {
		if (bs == null)
			bs = new BusinessLayer();
		return bs;
	}

	private BusinessLayer() {
		// TODO Auto-generated constructor stub
		sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
	}

	public boolean addComment(String user_id, String place_id, String mood_id,
			String comment) {
		// TODO Auto-generated method stub
		try {
			Rate newRate = new Rate();
			newRate.setUser((User) session.get(User.class, user_id));
			newRate.setMood((Mood) session.get(Mood.class, mood_id));
			newRate.setPlace((Place) session.get(Place.class, place_id));
			newRate.setComment(comment);
			newRate.setCdate(new Date());
			session.persist(newRate);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	public List<Category> getAllCategory() {
		Criteria criteria = session.createCriteria(Category.class);
		List<Category> category = criteria.list();
		return category;
	}
	
	public List<Mood> getAllMoods() {
		Criteria criteria = session.createCriteria(Mood.class);
		List<Mood> moods = criteria.list();
		return moods;
	}
	
	public List<Place> getAllPlacesWithCatID(int cat_id) {
		Criteria criteria = session.createCriteria(Place.class)
				.createAlias("place", "p")
				.add(Restrictions.eq("p.category.id", cat_id));
		List<Place> place = criteria.list();
		return place;
	}

	public List<Rate> viewAllCommentPerPlace(int p_id, int user_id) {
		Criteria criteria = session.createCriteria(Rate.class)
				.createAlias("rate", "r")
				.add(Restrictions.eq("r.place.id", p_id));
		List<Rate> rate = criteria.list();
		for (Rate r : rate) {
			if (r.getUser().getId() == user_id)
				r.setCan_edit(true);
			else
				r.setCan_edit(false);
		}
		return rate;
	}

	public User login(String email, String full_name, String user_id,
			String access_token) {
		Criteria cr = session.createCriteria(User.class);
		cr = cr.add(Restrictions.eq("email", email).ignoreCase());
		cr = cr.add(Restrictions.eq("accessToken", access_token).ignoreCase());
		User loggedUser = (User) cr.uniqueResult();

		if (loggedUser == null) {
			User newUser = new User();
			newUser.setAccessToken(access_token);
			newUser.setEmail(email);
			newUser.setFullName(full_name);
			session.persist(newUser);
			Criteria newcr = session.createCriteria(User.class);
			newcr = newcr.add(Restrictions.eq("email", email).ignoreCase());
			newcr = newcr.add(Restrictions.eq("accessToken", access_token).ignoreCase());
			 loggedUser = (User) newcr.uniqueResult();
		}
		return loggedUser;
	}

}
