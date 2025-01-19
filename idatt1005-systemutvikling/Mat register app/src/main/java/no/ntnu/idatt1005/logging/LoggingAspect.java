package no.ntnu.idatt1005.logging;

import java.util.Arrays;
import no.ntnu.idatt1005.model.data.Item;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * Aspect for logging service classes.
 * The aspect intercepts all public methods in the service classes
 * and logs the method name, arguments and return value. Exceptions are also intercepted and logged.
 * The aspect uses the SLF4J logger and the Logback logging framework.<br>
 * Method logs are stored in files in the logs directory.
 */
@Aspect
@Component
public class LoggingAspect {
    private static final Logger logger = LoggerFactory.getLogger(LoggingAspect.class);

    /**
     * Pointcut for all public methods in the service classes.
     * Specifies that the aspect should intercept all public methods in the services package.
     */
    @Pointcut("execution(public * no.ntnu.idatt1005.model.services.*.*(..))")
    private void publicMethodsFromLoggingPackage() {
    }

    /**
     * Advice for logging around the method.
     * Logs the method name, arguments and return value.
     * Exceptions in the service classes get rethrown and logged.
     *
     * @param joinPoint the join point
     * @return the return value of the method
     * @throws Throwable if the method throws an exception
     */
    @Around(value = "publicMethodsFromLoggingPackage()")
    public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
        String methodName = joinPoint.getSignature().getName();
        try {
            StringBuilder args = new StringBuilder();
            for (Object arg : joinPoint.getArgs()) {
                String argString = arg.toString().replace("\n", " ").replace("\r", " ");
                args.append(argString).append(", ");
            }
            logger.info("Method called: {} -- Class: {} -- Args: {}",
                methodName, joinPoint.getTarget().getClass().getName(), args);
        } catch (Exception e) {
            System.out.println("Logging aspect failed to log method: " + e.getMessage());
        }
        Object result = joinPoint.proceed(); // Executes the method, exceptions should be rethrown
        try {
            if (result != null) {
                logObject(result, methodName, result instanceof Item item ?
                    item.getName() : null);
            }
        } catch (Exception e) {
            System.out.println("Logging aspect failed to log object: " + e.getMessage());
        }
        return result;
    }

    /**
     * Logs the object returned from the method.
     * The method logs the object and the name of the object if it is an Item.
     *
     * @param object the object to log
     * @param methodName the name of the method
     * @param objectName the name of the object
     */
    private void logObject(Object object, String methodName, String... objectName) {
        try {
            if (objectName != null && objectName.length > 0) {
                logger.info("Object returned: {} -- Method {} -- Name of object: {}",
                    object.getClass().getName(), methodName, objectName[0]);
            } else {
                logger.info("Object returned: {} -- Method {}",
                    object.getClass().getName(), methodName);
            }
        } catch (Exception e) {
            System.out.println("Logging aspect failed to log object: " + e.getMessage());
        }
    }

    /**
     * Advice for logging exceptions.
     * Logs the exception message.
     *
     * @param exception the exception
     */
    @AfterThrowing(value = "publicMethodsFromLoggingPackage()", throwing = "exception")
    public void logException(Exception exception) {
        try {
            logger.error("Exception thrown: {}", exception.toString());
        } catch (Exception e) {
            System.out.println("Logging aspect failed to log exception: " + e.getMessage());
        }
    }

}
