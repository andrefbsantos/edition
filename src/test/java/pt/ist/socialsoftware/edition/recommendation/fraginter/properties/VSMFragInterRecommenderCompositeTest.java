package pt.ist.socialsoftware.edition.recommendation.fraginter.properties;

import org.junit.Assert;
import org.junit.Test;

import pt.ist.socialsoftware.edition.recommendation.properties.Property;

public abstract class VSMFragInterRecommenderCompositeTest extends VSMFragInterRecommenderStorableTest {

	protected Property compositeProperty;

	protected abstract Property getCompositeProperty();

	@Override
	public void setUp() {
		super.setUp();
		compositeProperty = getCompositeProperty();
	}

	@Test
	public void testCalculateSimiliratyWithCompositeWeight() {
		double calculateSimiliraty = recommender.calculateSimiliraty(frag1, frag2, compositeProperty);
		Assert.assertTrue(calculateSimiliraty >= 0);
		Assert.assertTrue(calculateSimiliraty <= 1.0000000000000002);
	}

}
