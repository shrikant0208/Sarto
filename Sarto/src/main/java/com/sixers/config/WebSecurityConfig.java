package com.sixers.config;

public class WebSecurityConfig {
}
/*@Configuration
//@EnableWebMvcSecurity
@Order(SecurityProperties.ACCESS_OVERRIDE_ORDER)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter 
{
	@Override
    protected void configure(HttpSecurity http) throws Exception {
		//http.authorizeRequests().antMatchers("/**").permitAll();
        
        http
        .authorizeRequests()
            .antMatchers("/", "/home").permitAll()
            .anyRequest().authenticated()
            .and()
        .formLogin()
            .loginPage("/login")
            .permitAll()
            .and()
        .logout()
            .permitAll();
        
    }

    
    @Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("Devendra").password("password").roles("USER");
	}
	
}*/
