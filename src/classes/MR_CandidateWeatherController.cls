public class MR_CandidateWeatherController {
    
    private String location;
    public WeatherInfoDao weatherInfo {
        get {
            MR_Utils utils            = new MR_Utils();
            system.debug(utils);
            String appId           = 'ea77eec72392d5163c6c06be812dff37';
            List< String > filters = new String[]{ this.location, appId };

            String param          = 'GET';
            // Using get method and no need to use author so define as null
            String author          = '';
            String body            = '';
            String format          = 'https://api.openweathermap.org/data/2.5/weather?' + 'q={0}&' + 'appid={1}';
            String restUrl         = String.format( format, filters );
            // Deserialize obtained json res
            String res             = utils.execRestApi( restUrl, param, author, body );
            system.debug('res:' + res);
            return ( WeatherInfoDao ) JSON.deserialize( res, WeatherInfoDao.class );
        }
    }

    public MR_CandidateWeatherController () {
        //get city weather with id of Candidate
        ID id          = ApexPages.currentPage().getParameters().get('id');
        Candidate__c c = [SELECT City__c FROM Candidate__c WHERE Candidate__c.Id =: id LIMIT 1];
        this.location  = c.City__c;
    }

    // Define object for weather repsone
    public class WeatherInfoDao {
        public Coord coord          { get; }
        public Weather[] weather    { get; }
        public String base          { get; }
        public Main main            { get; }
        public Integer visibility   { get; }
        public Wind wind            { get; }
        public Clouds clouds        { get; }
        public Integer dt           { get; }
        public Sys sys              { get; }
        public Integer id           { get; }
        public String name          { get; }
        public Integer cod          { get; }
    }

    public class Coord {
        public Double lon           { get; }
        public Double lat           { get; }
    }

    class Weather {
        public Integer id           { get; }
        public String main          { get; }
        public String description   { get; }
        public String icon          { get; }
    }

    class Main {
        public Double temp {
            get {
                return ( Integer ) temp / 10;
            }
            set;
        }
        public Integer pressure { get; }
        public Integer humidity { get; }
        public Double temp_min  { get; }
        public Double temp_max  { get; }
    }

    class Wind {
        public Double speed     { get; }
        public Integer deg      { get; }
    }

    class Clouds {
        public Integer all      { get; }
    }

    class Sys {
        public Integer type     { get; }
        public Integer id       { get; }
        public Double message   { get; }
        public String country   { get; }
        public Integer sunrise  { get; }
        public Integer sunset   { get; }
    }
}