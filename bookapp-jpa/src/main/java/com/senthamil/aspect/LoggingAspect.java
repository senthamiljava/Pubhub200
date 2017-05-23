package com.senthamil.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

	@Around("execution(* com.janani.service.*.*(..))")
	public Object aroundAdviceForAllMethods(ProceedingJoinPoint jp) throws Throwable {
		System.out.println("****Before advised method execution " + jp.getSignature().toString());
		Object result = jp.proceed();
		System.out.println("****After advised method execution " + jp.getSignature().getName());
		return result;
	}
}
