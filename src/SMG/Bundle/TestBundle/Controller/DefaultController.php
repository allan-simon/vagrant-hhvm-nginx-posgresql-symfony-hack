<?hh

namespace SMG\Bundle\TestBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

type IndexShape = shape(
    'name' => string
);

class DefaultController extends Controller
{

    /**
     * @Route("/hello/{name}")
     * @Template()
     */
    public function indexAction(string $name) : IndexShape
    {
        var_dump(get_loaded_extensions());
        return shape('name' => $name);
    }
}
