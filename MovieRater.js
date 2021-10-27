var MovieRater = artifacts.require("MovieRater.sol");

contract("Movie Rater", function() {

	it("initializes with 3 movies", function() {
		return MovieRater.deployed().then(function(instance) {
			return instance.numMovies();
		}).then(function(count) {
			assert.equal(count, 3);
		});
	});

	it("initializes movies with 0 ratings & scores", function() {
		return MovieRater.deployed().then(function(instance) {
			mrInstance = instance;
			return mrInstance.movies("James Bond");
		}).then(function(movie) {
			assert.equal(movie.name, "James Bond", "contains the correct name");
			assert.equal(movie.numRatings, 0, "has no ratings");
			assert.equal(movie.totalScore, 0, "has 0 score");
			return mrInstance.movies("Avengers");
		}).then(function(movie) {
			assert.equal(movie.name, "Avengers", "contains the correct name");
			assert.equal(movie.numRatings, 0, "has no ratings");
			assert.equal(movie.totalScore, 0, "has 0 score");
			return mrInstance.movies("Star Wars");
		}).then(function(movie) {
			assert.equal(movie.name, "Star Wars", "contains the correct name");
			assert.equal(movie.numRatings, 0, "has no ratings");
			assert.equal(movie.totalScore, 0, "has 0 score");
		});
	});

});