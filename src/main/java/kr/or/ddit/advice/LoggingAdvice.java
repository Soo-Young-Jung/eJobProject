package kr.or.ddit.advice;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Joinpoint : advice + target -> weaving 되는 지점 및 시점에 대한정보.
 * 			 : 스프링에서는 메소드 호출 joinpoint 만 지원됨.
 * 스프링에서 advice 종류
 * before
 * after : after-throwing / after-returing / after
 * around
 *
 */
@Aspect
public class LoggingAdvice {
	private static Logger logger = LoggerFactory.getLogger(LoggingAdvice.class);
	
	@Pointcut("execution(* kr.or.ddit.*.service.*.*(..))")
	public void dummy() {}
	
	@Around("dummy()")
	public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
		// before
		long startTime = System.currentTimeMillis();
		Object[] args = joinPoint.getArgs();
		Object target= joinPoint.getTarget();
		Signature signature = joinPoint.getSignature();
		String targetMethodName = signature.getName();
//		logger.info("{}.{} 가  호출, {} 파라미터 전달",
//				target.getClass().getSimpleName(), targetMethodName, Arrays.toString(args)
//				);
//		 target을 직접 호출
		Object retVal = joinPoint.proceed(args);
		long endTime = System.currentTimeMillis();
		// after
//		logger.info("{}.{} 소요시간 {}ms, 반환데이터 : {}", 
//				target.getClass().getSimpleName(), targetMethodName, (endTime-startTime), retVal);
		return retVal;
	}
}
