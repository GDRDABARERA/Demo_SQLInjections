package blog.pwned.sqli.samples;

import org.apache.commons.dbcp2.BasicDataSource;

/**
 * Created by ayoma on 6/26/17.
 */
public class ConnectionPoolUtil {
    private static volatile BasicDataSource dataSourceStory1;
    private static volatile BasicDataSource dataSourceStory2;
    private static volatile BasicDataSource dataSourceStory3;
    private static volatile BasicDataSource dataSourceStory4;
    private static volatile BasicDataSource dataSourceStory5;
    private static volatile BasicDataSource dataSourceStory6;

    private static BasicDataSource createDataSource(String dbName) {
        BasicDataSource ds = new BasicDataSource();
        ds.setUrl("jdbc:mysql://localhost/" + dbName);
        ds.setUsername("root");
        ds.setPassword("root");

        ds.setMinIdle(5);
        ds.setMaxIdle(10);
        ds.setMaxOpenPreparedStatements(100);

        return ds;
    }

    public synchronized static BasicDataSource getDataSourceStory1() {
        if (dataSourceStory1 == null) {
            dataSourceStory1 = createDataSource("APP_STAGE1");
        }
        return dataSourceStory1;
    }

    public synchronized static BasicDataSource getDataSourceStory2() {
        if (dataSourceStory2 == null) {
            dataSourceStory2 = createDataSource("APP_STAGE2");
        }
        return dataSourceStory2;
    }

    public synchronized static BasicDataSource getDataSourceStory3() {
        if (dataSourceStory3 == null) {
            dataSourceStory3 = createDataSource("APP_STAGE3");
        }
        return dataSourceStory3;
    }

    public synchronized static BasicDataSource getDataSourceStory4() {
        if (dataSourceStory4 == null) {
            dataSourceStory4 = createDataSource("APP_STAGE4");
        }
        return dataSourceStory4;
    }

    public synchronized static BasicDataSource getDataSourceStory5() {
        if (dataSourceStory5 == null) {
            dataSourceStory5 = createDataSource("APP_STAGE5");
        }
        return dataSourceStory5;
    }

    public synchronized static BasicDataSource getDataSourceStory6() {
        if (dataSourceStory6 == null) {
            dataSourceStory6 = createDataSource("APP_STAGE6");
        }
        return dataSourceStory6;
    }
}
