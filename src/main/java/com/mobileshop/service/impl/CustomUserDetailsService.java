package com.mobileshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mobileshop.entity.UserEntity;
import com.mobileshop.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	private UserRepository userRepository;

	public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {

		UserEntity user = userRepository.findByUsernameAndActive(username, 1);
		if (user == null) {
			return null;
		}

		boolean enabled = true;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = true;
		boolean accountNonLocked = true;

		return new User(username, user.getPassword(), enabled, accountNonExpired, credentialsNonExpired,
				accountNonLocked, user.getAuthorities());
	}

	





	
}
