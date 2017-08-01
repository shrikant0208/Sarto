package com.sixers.config;


import javax.annotation.Resource;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.ui.context.ThemeSource;
import org.springframework.ui.context.support.ResourceBundleThemeSource;
import org.springframework.web.servlet.ThemeResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.theme.CookieThemeResolver;
import org.springframework.web.servlet.theme.ThemeChangeInterceptor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.jolbox.bonecp.BoneCPConfig;
import com.jolbox.bonecp.BoneCPDataSource;
import com.sixers.interceptor.CustomInterceptor;

@Configuration
@ComponentScan(basePackages = "com.sixers")
@PropertySources({
	@PropertySource("file:${user.home}/properties/sip_mt_properties/query_mcube.properties"),
	@PropertySource("file:${user.home}/properties/sip_mt_properties/sql_mcube.properties")
})
public class WebConfig extends WebMvcConfigurerAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(WebConfig.class);
	@Resource
	private Environment environment;

	
	@Bean(name = "mappingDataSource")
	@Qualifier("mappingDataSource")
	public DataSource mappingDataSource(){
		String trimmedEachEnvironment = "map";
		logger.debug("Setting up the datasource for {}", trimmedEachEnvironment);

		BoneCPConfig bonecpConfig = new BoneCPConfig();
		bonecpConfig.setJdbcUrl(environment.getRequiredProperty(trimmedEachEnvironment + ".dbUrl"));
		bonecpConfig.setUsername(environment.getRequiredProperty(trimmedEachEnvironment + ".dbUser"));
		bonecpConfig.setPassword(environment.getRequiredProperty(trimmedEachEnvironment + ".dbPassword"));
		BoneCPDataSource dataSource = new BoneCPDataSource(bonecpConfig);
		dataSource.setDriverClass(environment.getRequiredProperty(trimmedEachEnvironment + ".driverClassName"));
		
		return dataSource;
	}
	
	@Bean(name = "mappingNamedParameterJdbcTemplate")
	@Qualifier("mappingNamedParameterJdbcTemplate")
	public NamedParameterJdbcTemplate getMappingNamedParameterJdbcTemplate(){
		return new NamedParameterJdbcTemplate(mappingDataSource());
	}
	
	
	
	 @Override
	    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
	        configurer.enable();
	    }

	    @Bean
	    public InternalResourceViewResolver viewResolver() {
	        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	        resolver.setPrefix("/WEB-INF/jsp/");
	        resolver.setSuffix(".jsp");
	        return resolver;
	    }
	
	    @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	    }

	
	    
	    @Bean
        public ReloadableResourceBundleMessageSource messageSource() {
                ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
                messageSource.setBasename("/WEB-INF/jsp/studentMessage");
                messageSource.setCacheSeconds(10); //reload messages every 10 seconds
                return messageSource;
        }
	    
	    
	    
	    @Bean
	    CustomInterceptor localInterceptor() {
	         return new CustomInterceptor();
	    }

	    @Override
	    public void addInterceptors(InterceptorRegistry registry) {
	        registry.addInterceptor(localInterceptor());
	        
	      //Theme specific
	    	ThemeChangeInterceptor themeInterceptor = new ThemeChangeInterceptor();
	    	themeInterceptor.setParamName("siteTheme");
	    	registry.addInterceptor(themeInterceptor);
	    }
	    
	    
	    
	    
	    
	    
	    /* Theme specific start */
	    @Bean
	    public ThemeSource themeSource() {
	    	ResourceBundleThemeSource source = new ResourceBundleThemeSource();
	    	source.setBasenamePrefix("theme-");
	    	return source;
	    }
	    @Bean 
	    public ThemeResolver themeResolver(){
	    	CookieThemeResolver resolver = new CookieThemeResolver();
	    /*	resolver.setCookieMaxAge(2400);*/
	    	resolver.setCookieName("defaultThemeName");
	    	resolver.setDefaultThemeName("red");
	    	return resolver;
	    }
	    /* End */
	    
	    
	    
	    
	
}
