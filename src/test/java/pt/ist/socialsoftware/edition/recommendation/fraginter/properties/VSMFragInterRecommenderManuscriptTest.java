package pt.ist.socialsoftware.edition.recommendation.fraginter.properties;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;

import pt.ist.socialsoftware.edition.domain.FragInter;
import pt.ist.socialsoftware.edition.domain.SourceInter;
import pt.ist.socialsoftware.edition.recommendation.properties.ManuscriptProperty;
import pt.ist.socialsoftware.edition.recommendation.properties.Property;

public class VSMFragInterRecommenderManuscriptTest extends VSMFragInterRecommenderStorableTest {

	// @Override
	// protected Property getCompositeProperty() {
	// return new ManuscriptProperty(2.0, 2.0, 2.0, 2.0);
	// }

	@Override
	protected FragInter getFragment1() {
		List<FragInter> list = new ArrayList<>(ldod.getFragment("Fr051").getFragmentInterSet());
		for(FragInter inter : list) {
			if(inter instanceof SourceInter)
				return inter;
		}
		return list.get(list.size() - 1);
	}

	@Override
	protected FragInter getFragment2() {
		List<FragInter> list = new ArrayList<>(ldod.getFragment("Fr011").getFragmentInterSet());
		for(FragInter inter : list) {
			if(inter instanceof SourceInter)
				return inter;
		}
		return list.get(list.size() - 1);
	}

	@Override
	protected Property getProperty() {
		return new ManuscriptProperty();
	}

	@Override
	protected Property getPropertyWithWeight() {
		return new ManuscriptProperty(2.0);
	}

	@Override
	protected Property getPropertyWithZeroWeight() {
		return new ManuscriptProperty(0.);
	}

	@Override
	@Test
	public void testCalculateSimiliraty() {
		double calculateSimiliraty = recommender.calculateSimiliraty(frag1, frag2, properties);
		Assert.assertEquals(1.0, calculateSimiliraty, DELTA);
	}

	@Override
	@Test
	public void testCalculateSimiliratyWithWeight() {
		double calculateSimiliraty = recommender.calculateSimiliraty(frag1, frag2, propertyWithWeight);
		Assert.assertEquals(1.0, calculateSimiliraty, DELTA);
	}
}
